module LogsHelper
  def date_padded_logs(logs_array)
    min_date = logs_array.min_by{ |h| h["created_at"] }["created_at"].to_date
    max_date = logs_array.max_by{ |h| h["created_at"] }["created_at"].to_date

    date_range = [*min_date..max_date]

    date_range.each_with_object([]) do |date, array|
      logs_for_date = logs_array.select {|h| h["created_at"].to_date == date }
      logs_for_date = [{ "created_at" => date.to_datetime, value: "0" }] if logs_for_date.blank?

      array.push(*logs_for_date)
    end
  end

  # returns values formatted for the d3 chart
  def chart_values(logs, pad_dates = false)
    logs_array = logs.map { |log| log.attributes.slice("created_at", "value") }

    logs_array = date_padded_logs(logs_array) if (logs_array.present? && pad_dates)

    logs_array.each_with_object([]) do |log, array|
      array.push({
        date: log["created_at"].to_s(:for_d3),
        value: log["value"].to_f
      })
    end
  end
end
