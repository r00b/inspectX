# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: 'Admin', email: 'admin@gmail.com', password: '123456', password_confirmation: '123456', role: 2)

mechanic = User.create(name: 'John Johnes', email: 'john@gmail.com', password: '123456', password_confirmation: '123456', role: 1)
Mechanic.create(
    bio: "Striving for Accura", 
    speciality: 'test data',
    company: 'test company',
    address: 'test address',
    city: 'test city',
    state: 'test state',
    zip: '111222',
    price: 100,
    approved: true,
    user_id: mechanic.id
    )
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email
#
# user = User.new(
#       :name                  => "William Peronilla",
#       :email                 => "william@example.com",
#       :password              => "123456",
#       :password_confirmation => "123456",
#       :bio                  => "Striving for Accuracy – William will see the problem through to the end applying his creative thinking. He fixes vehicles on the first visit with no comebacks. He has maintained this record consistently attributable to his thorough initial diagnostic. Being a former US Army helicopter crew chief, he ensured the aircraft was always “battle ready.” His primary focus was the safe return of pilots.
#       Knowledge, skill and training- William possesses a combination of skills and experience that makes him stand out from the rest. He has an extensive formal education and training in all different types of vehicle that includes electric and hybrids. William has over 20 years of experience in the field, his master certification is updated quarterly. Through Customer Satisfaction rating, William has consistently rated above satisfactory.
#       Adaptability- William has proven to be successful in working independently and as part of a team. He ensures vehicles dispatched to him are completed by the end of the day, requiring him to adapt to a fast pace environment.  Because of the end of day deadline, William calls upon the assistance of other technicians to isolate vehicle problems such as interior noises and chassis noises.  He routinely works on a variety of vehicle types—gas, electric and hybrids.",
#     :speciality             => "Mercedes",
#     :company                => "Tesla Motors",
#     :address                => "3550 Carter Drive Apt 55, South",
#     :city                   => "San Francisco",
#     :state                  => "CA",
#     :zip                    => "94080",
#     :price                   => "175"
#     :approved                => "true"
#   )
#   user.skip_confirmation!
#   user.save!
#
#   user = User.new(
#       :name                  => "Toby Sample",
#       :email                 => "toby@example.com",
#       :password              => "123456",
#       :password_confirmation => "123456",
#       :bio                  => "I have spent over 12 years in German vehicle specific repair shops. I am an ASE Certified Master Technician. I currently work at a German car specific independent shop in Santa Barbara. ",
#     :speciality             => "Audi",
#     :company                => "Example Company",
#     :address                => "123 Sample Street",
#     :city                   => "Santa Barbara",
#     :state                  => "CA",
#     :zip                    => "93108",
#     :price                   => "100"
#     :approved                => "true"
#   )
#   user.skip_confirmation!
#   user.save!