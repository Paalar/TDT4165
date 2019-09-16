functor
import
  Application(exit:Exit)
  System
define
  \insert List.oz

  List = [1 2 8 10]
  List2 = [3 20 40]
  {System.showInfo {Length List}} % 7a
  {System.show {Take List 20}} % 7b
  {System.show {Take List 2}} % 7b
  {System.show {Drop List 1}} % 7c
  {System.show {Append List List2}} % 7d
  {System.show {Member List 2}} % 7e
  {System.show {Member List 20}} % 7e
  {System.show {Position List 2}} % 7f
  {System.show {Position List 20}} % 7f
  {Exit 0}
end
