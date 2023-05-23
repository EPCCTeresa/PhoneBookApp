class PhoneContactsController < ApplicationController
  before_action :set_phone_contact, only: %i[ show edit update destroy ]

  # GET /phone_contacts or /phone_contacts.json
  def index
    @phone_contacts = PhoneContact.all
  end

  # GET /phone_contacts/1 or /phone_contacts/1.json
  def show
  end

  # GET /phone_contacts/new
  def new
    @phone_contact = PhoneContact.new
  end

  # GET /phone_contacts/1/edit
  def edit
  end

  # POST /phone_contacts or /phone_contacts.json
  def create
    @phone_contact = PhoneContact.new(phone_contact_params)

    respond_to do |format|
      if @phone_contact.save
        format.html { redirect_to phone_contact_url(@phone_contact), notice: "Phone contact was successfully created." }
        format.json { render :show, status: :created, location: @phone_contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @phone_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phone_contacts/1 or /phone_contacts/1.json
  def update
    respond_to do |format|
      if @phone_contact.update(phone_contact_params)
        format.html { redirect_to phone_contact_url(@phone_contact), notice: "Phone contact was successfully updated." }
        format.json { render :show, status: :ok, location: @phone_contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @phone_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phone_contacts/1 or /phone_contacts/1.json
  def destroy
    @phone_contact.destroy

    respond_to do |format|
      format.html { redirect_to phone_contacts_url, notice: "Phone contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phone_contact
      @phone_contact = PhoneContact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def phone_contact_params
      params.require(:phone_contact).permit(:firstname, :lastname, :phone)
    end
end
