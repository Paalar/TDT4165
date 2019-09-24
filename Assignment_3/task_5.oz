fun {LazyNumberGenerator StartValue}
  StartValue | fun {$} {LazyNumberGenerator StartValue + 1} end
end
