module UsersHelper
  def edit_account_path_for(user)
    url_for [:edit, user.class.to_s.downcase, :account]
  end

  def highest_education_for(counselor)
    counselor.attributes.slice('doctoral_degree', 'graduate_degree', 'undergraduate_degree').values.compact.first
  end

  def issues_for(user, count=nil)
    user.issues.limit(count).map {|i| t("issues.#{i.name}")}.push(user.other_issues).compact.join(", ")
  end

  def languages_for(user)
    standard_and_other_for(user, :languages)
  end

  def religions_for(user)
    standard_and_other_for(user, :religions)
  end

  def standard_and_other_for(object, attribute)
    (object.send(attribute).to_a.map {|l| t("#{attribute}.#{l}")} +
     [object.send("other_#{attribute}")]).reject(&:blank?).join(', ')
  end
end
