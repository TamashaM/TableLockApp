require 'ruby-jmeter'
test do
  threads count: 10 do

    visit name:'TableLock/login',  url: 'http://localhost:3000/login'

  end
end.jmx(file: "/tmp/my_testplan.jmx")
# submit 'http://localhost:3000/login',
#        fill_in: {
#            email: 'tam@gmail.com',
#            password: 'password',
#            'csrf-token' => '${csrf-token}'
#        }