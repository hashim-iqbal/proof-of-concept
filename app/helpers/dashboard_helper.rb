# frozen_string_literal: true

module DashboardHelper
  DATE_FORMAT = '%_m/%-d'

  def build_line_chart(conversions)
    line_chart conversions.group_by_day(:time).count,
               height: '125px',
               stacked: true,
               points: false,
               legend: false,
               xtitle: "Conversions  #{conversions.first.time.to_date.strftime(DATE_FORMAT)} - \
               #{conversions.last.time.to_date.strftime(DATE_FORMAT)}".gsub('  ', '')
  end
end
