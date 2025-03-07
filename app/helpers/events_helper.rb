module EventsHelper
  def formatted_date(string)
    date = Date.parse(string)
    formatted_date = date.strftime("%B %d, %Y")
    formatted_date
  end
end
