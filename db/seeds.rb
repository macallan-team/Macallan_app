# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# require 'faker'



# EndUser.create!(
#     email: Faker::Food.fruits+"uuseruser@user.com",
#     encrypted_password: "abc123",
#     reset_password_token: "aaa123",
#     reset_password_sent_at: "aaa123",
#     remember_created_at: "123abc",
#     sign_in_count: "kkkkk",
#     current_sign_in_at: "kkkkk",
#     last_sign_in_at: "kkkkk",
#     current_sign_in_ip:"kkkkk",
#     last_sign_in_ip: "kkkkk",
#     last_name: "kushi",
#     first_name: "yuya",
#     last_kana: "kushi",
#     first_kana: "yuya",
#     postal_code: "2345678",
#     address: "神南",
#     phone_number: "0120777777",
#     created_at: "2019/08/30",
#     updated_at: "2019/08/30",
#     deleted_at: "",
#     password: "abc123"
# )




# Order.create!(
#     end_user_id: 1,
#     purchased_at: "2019/08/30",
#     shipping_status: "販売中",
#     total_price: "11111",
#     payment: "1",
#     shipping_name: "安倍",
#     shipping_phone_number: "0120777777",
#     shipping_address: "abiko",
#     shipping_postal_code: "260222222",
#     subtotal: "50",
#     created_at: "2019/08/30",
#     updated_at: "2019/08/30"
# )



Admin.create!(
    email: "uuseruser@user.com",
    password: "111111"
)


# OrderItem.create!(
#     order_id: "1",
#     item_id: "1",
#     price: "1111",
#     count: "15",
#     created_at: "2019/08/30",
#     updated_at: "2019/08/30"
# )
