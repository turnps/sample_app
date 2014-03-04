require 'spec_helper'

describe "Static Pages" do
  
  subject { page }
  
  shared_examples_for "all static pages" do
    it { should have_content(heading) }
    it { should have_title(full_title(page_title)) }
  end
  
  describe "Home page" do
    before { visit root_path }
    let(:heading) {'Sample App'}
    let(:page_title) {''}
    
    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }
  end
  
  describe "Help page" do
    before { visit help_path }
    let(:heading) {'Help'}
    let(:page_title) {'Help'}
    
    it_should_behave_like "all static pages"
  end
  
  describe "About page" do
    before { visit about_path }
    let(:heading) {'About'}
    let(:page_title) {'About'}
    
    it_should_behave_like "all static pages"
  end
  
  describe "Contact Page" do
    before { visit contact_path }
    
    it { should have_selector('h1', text: 'Contact') }
    it { should have_title(full_title('Contact')) }
  end
  
end
