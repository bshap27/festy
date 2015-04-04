class DatabaseChecker

  def no_lineup?
    Festival.all.select {|fest| fest.artists.count < 20}
  end

end