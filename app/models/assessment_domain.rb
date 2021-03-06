class AssessmentDomain < ActiveRecord::Base
  belongs_to :assessment
  belongs_to :domain

  validates :domain_id, presence: true
  validates :score, presence: true
  validates :reason, presence: true
  validates :domain, presence: true
  validates :goal, presence: true

  default_scope { joins(:domain).order('domains.name ASC') }

  def self.domain_color_class(domain_id)
    find_by(domain_id: domain_id).score_color_class
  end

  def critical_problem?
    score_color_class == 'danger'
  end

  def has_problem?
    score_color_class == 'warning'
  end

  def not_ideal?
    score_color_class == 'info'
  end

  def good?
    score_color_class == 'success'
  end

  def score_color_class
    domain["score_#{score}_color"]
  end

  def previous_score_color_class
    domain["score_#{previous_score}_color"]
  end
end
