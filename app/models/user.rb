class User < ActiveRecord::Base
  self.per_page = 15

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :sorted_by,
      :search_username,
      :search_firstname_lastname,
      :search_email,
    ]
  )

  scope :sorted_by, lambda { |x| order(created_at: :desc) }


  scope :search_username, lambda { |query|
    return nil  if query.blank?
    terms = query.downcase.split(/\s+/)
    terms = terms.map { |e|
      ('%' + e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    num_or_conds = 1
    where(
      terms.map { |term|
        "(LOWER(users.username) LIKE ?)"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }

  scope :search_firstname_lastname, lambda { |query|
    return nil  if query.blank?
    terms = query.downcase.split(/\s+/)
    terms = terms.map { |e|
      ('%' + e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    num_or_conds = 2
    where(
      terms.map { |term|
        "(LOWER(users.first_name) LIKE ? OR LOWER(users.last_name) LIKE ?)"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }

  scope :search_email, lambda { |query|
    return nil  if query.blank?
    terms = query.downcase.split(/\s+/)
    terms = terms.map { |e|
      ('%' + e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    num_or_conds = 1
    where(
      terms.map { |term|
        "(LOWER(users.username) LIKE ?)"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }

  def organizer?
    return true if self.organizer == true
    false
  end

  def referee?
    return true if self.referee == true
    false
  end

  def volunteer?
    return true if self.volunteer == true
    false
  end
end
