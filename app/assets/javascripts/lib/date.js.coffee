Date.today = ->
  new Date()

Date.parseDate = (dateString) ->
  new Date(Date.parse(dateString) + new Date().getTimezoneOffset() * 60 * 1000)

Date.prototype.toLocalDateString = ->
  date = this.getDate()
  datestr = if date > 9 then date.toString() else "0#{date}"
  month = this.getMonth() + 1
  monthstr = if month > 9 then month.toString() else "0#{month}"
  "#{this.getFullYear()}-#{monthstr}-#{datestr}"

