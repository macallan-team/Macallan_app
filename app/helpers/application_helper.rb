module ApplicationHelper
    # admin側での販売ステータス表示
    def sales_status(item)
        if item.sales_status == 'on_sale'
            return '販売中'
        elsif item.sales_status == 'suspension'
            return '販売停止中'
        else
            return '削除済み'
        end
    end
    
    # dateを見やすくする
    def simple_date(date)
        return  date.strftime('%Y年%-m月%-d日')
    end
    # カートアイテムの単価*数量
    def total_price(cart_item)
        return cart_item.item.price * cart_item.count
    end
    def tax_included_cart_total
        cart_items = current_end_user.cart_items
        array = []
        cart_items.each do |cart_item|
          array << (BigDecimal(cart_item.item.price.to_s) * BigDecimal(tax_rate.to_s)).to_f.floor.to_i * cart_item.count
        end
    end
    # 税の計算
    def tax_calc(num)
        return num = (BigDecimal(num.to_s)*BigDecimal(tax_rate)).floor.to_i
    end
        
        
    def resource_name
        :end_users
     end
    #  フラグの立っている送料レートを返す
    def carriage_rate
        carriage = Carriage.find_by(valid_flag: 'on')
        return carriage.rate
    end
    # フラグの立っている税率レートを返す
    def tax_rate
        tax = Tax.find_by(valid_flag: 'on')
        return tax.rate
    end

     def resource
        @resource ||= EndUser.new
     end
    # エンドユーザー側の販売ステータス・在庫数チェック
    def stock_check(item)
        if item.sales_status == "on_sale"
            if item.stock <= 0
                return "sold_out"
            else
                return "販売中"
            end
        else
            return "sold out"
        end
    end
    def payment(payment)
        if payment == 'cash_on_delivery'
            return '代金引換'
        else
            return '銀行振込'
        end
    end
    def postal_code(postal_code)
        postal_code = postal_code.split("").insert(3, '-').join
        return postal_code
    end

     def devise_mapping
        @devise_mapping ||= Devise.mappings[:end_users]
     end

end
