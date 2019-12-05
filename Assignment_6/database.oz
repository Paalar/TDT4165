\insert 'relation_class.oz'

Edges = {New RelationClass init}
Cabins = [
  distance(1 2 2 true) distance(1 7 6 true) distance(1 5 2 true) distance(1 3 1 true) % Cabin 1
  distance(2 4 2 true) distance(2 6 5 true) % Cabin 2
  distance(3 6 3 true) distance(3 8 2 true) % Cabin 3
  distance(4 3 3 true) distance(4 1 3 false) % Cabin 4
  distance(5 8 3 true) distance(5 1 3 false) % Cabin 5
  distance(6 7 1 false) distance(6 4 4 true) % Cabin 6
  distance(7 4 4 true) distance(7 2 3 false) % Cabin 7
  distance(8 1 7 true) % Cabin 8
]

% Initialize the Edges
{Edges assertall(Cabins)}

% Query the database for a distance between CabinA and CabinB
proc {EdgeP A B} {Edges query(distance(A B _ true))} end
proc {DistP A B X} {Edges query(distance(A B X true))} end

% Given a cabin and a destination
% First, the start cabin, A, is added to the path
% Second, start from cabin A and search for cabin B
proc {PathP ?A ?B ?Path}
    {Path2P A B [A] 0 Path}
end

proc {Path2P ?A ?B Trace TotalDistance ?Path}
    % If A can be bound to B, the goal has been reached and
    % the distance as well as the path used is returned
    choice
        A=B
        Path=TotalDistance#{Reverse Trace}
    [] C Dist in
        {EdgeP A C}
        % Fail if the reached cabin is in the trace.
        {Member C Trace}=false
        % If the cabin has not yet been found, find the distance of the new path
        {DistP A C Dist}
        % Add the new cabin to the path and its distance to the total distance.
        {Path2P C B C|Trace Dist+TotalDistance Path}
    end
end

fun {Plan Cabin1 Cabin2} 
    proc {$ X?} {PathP Cabin1 Cabin2 X} end
end

fun {BestPlan Cabin1 Cabin2}
    % Return the best path
    fun {FindBestPath Paths ShortestDistance BestPath}
        case Paths of Head|Tail then
            % If head is a diff list, split it into distance and path and do if-else.
            case Head of Dist#Path then
                % Set the first path
                if ShortestDistance == inf then
                    {FindBestPath Tail Dist Path}
                % Replace old path with new one
                else if Dist < ShortestDistance then
                    {FindBestPath Tail Dist Path}
                else
                    {FindBestPath Tail ShortestDistance BestPath}
                end
            end
        end
        [] nil then
            ShortestDistance#BestPath
        end
    end in
    {FindBestPath {SolveAll {Plan Cabin1 Cabin2}} inf nil}
end
