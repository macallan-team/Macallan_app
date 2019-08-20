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
    # 関連するアーティストなどが存在するかチェック
    def check_null(item_child)
        if item_child.nil?
            return 'なし'
        else
            return item_child
        end
    end
    # dateを見やすくする
    def simple_date(date)
        return  date.strftime('%Y年%m月%d日')
    end
    # カートアイテムの単価*数量*税を算出
    def total_price(cart_item)
        return BigDecimal((cart_item.item.price * 1.08).to_f.floor * cart_item.count)
    end


    def resource_name
        :end_users
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

    def postal_hyphen(postal_code)
        postal_code = postal_code.split("").insert(3, '-').join
        return postal_code
    end

     def devise_mapping
        @devise_mapping ||= Devise.mappings[:end_users]
     end

end
