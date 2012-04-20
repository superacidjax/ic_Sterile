module PersonalInformationHelper

  def personal_information_path
    if current_user.personal_information?
      edit_client_account_personal_information_path
    else
      new_client_account_personal_information_path
    end
  end

end
