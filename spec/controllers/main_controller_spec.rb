require 'rails_helper'

RSpec.describe MainController, type: :controller    do #  , focus: true

  # let(:current_user) { create(:user) }   # User = 1. Tree = 1. profile_id = 63
  # let(:currentuser_id) {current_user.id}
  #
  # before {
  #   allow(controller).to receive(:logged_in?)
  #   allow(controller).to receive(:current_user).and_return current_user
  #
  #   FactoryGirl.create(:user, :user_2)  # User = 2. Tree = 2. profile_id = 66
  #   FactoryGirl.create(:user, :user_3 )  # User = 3 . Tree = [3]. profile_id = 22
  #   FactoryGirl.create(:user, :user_4 )  # User = 4 . Tree = 10. profile_id = 444
  #   # puts "before All: current_user.id = #{current_user.id} \n" # id = 1
  #   # puts "before All: User.last.id = #{User.last.id} \n" # id = 2
  #   # puts "before All: User.find(2).profile_id = #{User.find(2).profile_id} \n" # id = 2 profile_id = 66
  #
  #   FactoryGirl.create(:connected_user, :correct)      # 1  2
  #   FactoryGirl.create(:connected_user, :correct_3_4)  # 3  4
  #   # puts "before All: ConnectedUser.count = #{ConnectedUser.all.count} \n" # 2 rows
  #
  #   # Profile
  #   FactoryGirl.create(:profile, :profile_63)
  #   FactoryGirl.create(:profile, :profile_64)
  #   FactoryGirl.create(:profile, :profile_65)
  #   FactoryGirl.create(:profile, :profile_66)
  #   FactoryGirl.create(:profile, :profile_67)
  #   FactoryGirl.create(:profile, :profile_68)
  #   FactoryGirl.create(:profile, :profile_69)
  #   FactoryGirl.create(:profile, :profile_70)
  #   FactoryGirl.create(:profile, :profile_78)
  #   FactoryGirl.create(:profile, :profile_79)
  #   FactoryGirl.create(:profile, :profile_80)
  #   FactoryGirl.create(:profile, :profile_81)
  #   FactoryGirl.create(:profile, :profile_82)
  #   FactoryGirl.create(:profile, :profile_83)
  #   FactoryGirl.create(:profile, :profile_84)
  #   # puts "before All: Profile.find(63).user_id = #{Profile.find(63).user_id.inspect} \n"  # id = 63
  #   # puts "before All: Profile.find(66).name_id = #{Profile.find(66).name_id.inspect} \n"  # id = 66
  #   # puts "before All: Profile.last.id = #{Profile.last.id} \n"  # id = 64
  #   # puts "before All: Profile.last.name_id = #{Profile.last.name_id} \n"  # name_id = 90
  #   # puts "before All: Profile.count = #{Profile.all.count} \n" # 2
  #
  # }
  #
  # after {
  #   User.delete_all
  #   User.reset_pk_sequence
  #   ConnectedUser.delete_all
  #   ConnectedUser.reset_pk_sequence
  #   Tree.delete_all
  #   Tree.reset_pk_sequence
  #   Profile.delete_all
  #   Profile.reset_pk_sequence
  #   Name.delete_all
  #   Name.reset_pk_sequence
  # }

  
  let(:base_title) {"Experteese RoR Sample App"}
  
  describe 'CHECK MainController methods'  do  # , focus: true
    # let(:connected_users) { current_user.get_connected_users }

    
    # context '- before actions - check connected_users' do
    #   # let(:connected_users) { current_user.get_connected_users }
    #   it "- Return proper connected_users Array result for current_user_id = 1" do
    #     puts "Check CommonLogsController \n"
    #     puts "Before All - data created \n"  #
    #     # puts "In check connected_users :  connected_users = #{connected_users} \n"
    #     expect(connected_users).to be_a_kind_of(Array)
    #   end
    #   it "- Return proper connected_users Array result for current_user_id = 1" do
    #     # puts "1 2 In check connected_users :  connected_users = #{connected_users} \n"
    #     expect(connected_users).to eq([1,2])
    #   end
    # end
  
    subject { page }
    
    describe "GET #root" do
      context '- check the root route: render_template & response status' do
        subject { get :root }
        it "renders the :index template" do
          expect(get: root_url(subdomain: nil)).to route_to(controller: "main", action: "index")
        end
        it '- responds with 200' do
          expect(response.status).to eq(200)
        end
        it '- no responds with 401' do
          expect(response.status).to_not eq(401)
        end
      end
      context '- check visit the root path' do
        before { visit root_path }
  
        it { should have_content ('Experteese - sample App') }
        # it { should have_title ("Index | #{base_title}") }
        it { should have_title(full_title('')) }
        it { should_not have_title('| Index') }
        
      end
      context 'check links ' do  # заполнить
        before { visit root_path }
        it "should have the right links on the layout" do
          click_link "About"
            expect(page).to have_title(full_title('About'))
          click_link "Help"
            expect(page).to have_title(full_title('Help'))
          click_link "Home"
          click_link "Contact"
            expect(page).to have_title(full_title('Contacts'))
          click_link "Home"
          click_link "Sign up now!"
            expect(page).to have_title(full_title('Sign up'))
          click_link "Experteese"
            expect(page).to have_title(full_title(''))
          click_link "Home"
            expect(page).to have_title(full_title(''))
        end

      end
    end

    
    
    describe "GET #index" do
      context '- after action <index> - check render_template & response status' do
        subject { get :index }
        it "- render_template index" do
          puts "Check #index\n"
          puts "base_title = #{base_title}\n "
          expect(subject).to render_template :index
        end
        it '- responds with 200' do
          expect(response.status).to eq(200)
        end
        it "returns http success" do
          expect(subject).to have_http_status(:success)
        end
        it '- no responds with 401' do
          expect(response.status).to_not eq(401)
        end
        
        
        
        it "returns page.title correct" do
          get :index
          # puts response.body
          expect(response.body).to have_selector("title", :text => "Index | Experteese RoR Sample App", :visible => false)
        end
        # it "should have the content 'Index'" do
        #   visit index_path
        #   expect(page).to have_content('Index')
        # end
        # it "should have the title 'Index'" do
        #   visit index_path
        #   expect(page).to have_title("Index | #{base_title}")
        # end

      end
      
      context '- check visit the index_path' do
        before { visit index_path }
  
        # it { should have_content ('Index') }
        # it { should have_title ("Index | #{base_title}") }
        it { should have_title(full_title('Index')) }
        it { should_not have_title('| Index') }
      end

    end
             
    # describe "GET #create" do
    #   it "returns http success" do
    #     get :create
    #     expect(response).to have_http_status(:success)
    #   end
    # end
    
    describe "GET #help" do
      before(:each) { get :help }
        it "returns http success" do
        puts "Check #help\n"
        expect(response).to have_http_status(:success)
      end
      it "returns page.title correct" do
        expect(response.body).to have_selector("title", :text => "Help | #{base_title}", :visible => false)
      end
      # it "should have the content 'Help'" do
      #   visit help_path
      #   expect(page).to have_content('Help')
      # end
      # it "should have the title 'Help'" do
      #   visit help_path
      #   expect(page).to have_title("Help | #{base_title}")
      # end

      context '- check visit the help_path' do
        before { visit help_path }
  
        it { should have_content ('Help') }
        # it { should have_title ("Index | #{base_title}") }
        it { should have_title(full_title('Help')) }
        it { should_not have_title('| Help') }
      end


    end
    
    describe "GET #contacts" do
      before(:each) { get :contacts }
      it "returns http success" do
        puts "Check #contacts\n"
          expect(response).to have_http_status(:success)
      end
      it "returns page.title correct" do
        expect(response.body).to have_selector("title", :text => "Contacts | #{base_title}", :visible => false)
      end
      it 'has correct H1 tag' do
        h1_text = 'Contacts'
        expect(response.body).to have_selector('h1', text: h1_text)
      end
      # it "should have the content 'Contacts'" do
      #   # visit '/main/contacts'
      #   visit contacts_path
      #   expect(page).to have_content('Contacts')
      # end
      # it "should have the title 'Contacts'" do
      #   visit contacts_path
      #   expect(page).to have_title("Contacts | #{base_title}")
      # end
      context '- check visit the contacts_path' do
        before { visit contacts_path }
  
        it { should have_content ('Contacts') }
        # it { should have_title ("Index | #{base_title}") }
        it { should have_title(full_title('Contacts')) }
        it { should_not have_title('| Contacts') }
      end

    end

    describe "GET #about" do
      # subject { get :about }
      before(:each) { get :about }
      it "returns http success" do
        puts "Check #about\n"
        expect(response).to have_http_status(:success)
      end
      it "returns page.title correct" do
        expect(response.body).to have_selector("title", :text => "About | #{base_title}", :visible => false)
      end
      it 'has correct H1 tag' do
        h1_text = 'About'
        expect(response.body).to have_selector('h1', text: h1_text)
      end
      # it "should have the content 'About'" do
      #   # visit '/main/contacts'
      #   visit about_path
      #   expect(page).to have_content('About')
      # end
      # it "should have the title 'About'" do
      #   visit about_path
      #   expect(page).to have_title("About | #{base_title}")
      # end
      
      context '- check visit the about_path' do
        before { visit about_path }
  
        it { should have_content ('About') }
        it { should have_title(full_title('About')) }
        it { should_not have_title('| About') }
      end

    end

    # describe "GET #destroy" do
    #   it "returns http success" do
    #     get :destroy
    #     expect(response).to have_http_status(:success)
    #   end
    # end

 
  end


end
