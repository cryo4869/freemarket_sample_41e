module ProductsHelper
  def sell_status(status_id)
  case status_id
  when 2 then
     return 'sell-stop' # オブジェクトが値1の時に実行される
  when 3 then
    return 'sell-sold'
  end
 end
end
