module ApplicationHelper
    def sales_status(item)
        if item.sales_status == 'on_sale'
            return '販売中'
        else
            return '販売停止中'
        end
    end


end
