# frozen_string_literal: true

module DashboardHelper
  def build_line_chart(user)
    conversions = user.conversions.order(:time)

    line_chart conversions.group_by_day(:time).count,
               height: '125px',
               width: '150px',
               stacked: true,
               points: false,
               legend: false,
               xtitle: "Conversions #{conversions.first.time.to_date.strftime('%_m/%-d')} - \
               #{conversions.last.time.to_date.strftime('%_m/%-d')}".gsub('  ', '')
  end
end
