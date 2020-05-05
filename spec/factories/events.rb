FactoryBot.define do
  factory :event do
    title "MyString"
    body "MyText"
    disp_flg false
    start_time "2020-05-06 02:02:11"
    end_time "2020-05-06 02:02:12"
    allDay "MyString"
    user nil
  end
end
