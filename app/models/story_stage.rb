class StoryStage < ActiveRecord::Base
  belongs_to :story
  belongs_to :from, polymorphic: true
  belongs_to :to, polymorphic: true
  acts_as_list scope: :story
  def to_str
    "#{to_type}_#{to_id}"
  end
  def to_str=(val)
    self.to_type, self.to_id = val.split("_")
  end
  def from_str
    "#{from_type}_#{from_id}"
  end
  def from_str=(val)
    self.from_type, self.from_id = val.split("_")
  end
end
