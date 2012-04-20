class Admin::CounselorsController < Admin::Abstract
  expose(:counselors) { Counselor.order(:last_name, :first_name) }
  expose(:counselor)

  def update
    if counselor.update_attributes(params[:counselor])
      redirect_to root_path, :notice => "Successfully updated"
    else
      render :notes
    end
  end

  def reject
    unless counselor.reject
      # force the issue, since state_machine won't let you ignore validations
      # and admins should be able to reject a record regardless of it's state
      counselor.update_attribute(:status,'rejected')
      RegistrationMailer.rejection_notification(counselor).deliver
    end
    redirect_to admin_counselors_path
  end

  def approve
    if counselor.approve
      redirect_to admin_counselors_path
    else
      redirect_to admin_counselor_path(counselor), :notice => counselor.errors.full_messages.to_sentence
    end
  end

  def deactivate
    counselor.deactivate!
    redirect_to admin_counselors_path
  end

  def reactivate
    counselor.reactivate!
    redirect_to admin_counselors_path
  end
end
