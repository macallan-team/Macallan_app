module ApplicationHelper
    def sales_status(item)
        if item.sales_status == 'on_sale'
            return '販売中'
        elsif item.sales_status == 'suspension'
            return '販売停止中'
        else
            return '削除済み'
        end
    end
    def check_null(item_child)
        if item_child.nil?
            return 'なし'
        else
            return item_child
        end
    end
    def simple_date(date)
        return  date.strftime('%Y年%m月%d日')
    end
end
