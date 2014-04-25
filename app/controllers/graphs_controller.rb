class GraphsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json do 
        render :json => {
          :nodes => 
            System.all.collect {|x| {:id => "System_#{x.id}", :name => x.name, :type => 'system', :url => system_path(x)}} +
            Person.all.collect {|x| {:id => "Person_#{x.id}", :name => x.role, :type => 'person', :url => person_path(x)}},
          :links => 
            SystemLink.all.collect {|x| {:source => "System_#{x.system_a.id}", :target => "System_#{x.system_b.id}", :type => 'system_link', :id => x.id}} +
            StoryStage.all.collect {|x| {:source => "#{x.from_type}_#{x.from_id}", :target => "#{x.to_type}_#{x.to_id}", :type => 'story_stage', :id => x.id}}
        }
      end
    end
  end
end
