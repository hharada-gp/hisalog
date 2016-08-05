module ArticlesHelper
  def date(d)
    "#{d.strftime('%Y/%m/%d %H:%M:%S')}"
  end
end
