class Catalogs::SuppliersController < ApplicationController
  before_action :set_catalogs_supplier, only: [:show, :edit, :update, :destroy]

  # GET /catalogs/suppliers
  # GET /catalogs/suppliers.json
  def index
    @catalogs_suppliers = Catalogs::Supplier.all
  end

  # GET /catalogs/suppliers/1
  # GET /catalogs/suppliers/1.json
  def show
  end

  # GET /catalogs/suppliers/new
  def new
    @catalogs_supplier = Catalogs::Supplier.new
  end

  # GET /catalogs/suppliers/1/edit
  def edit
  end

  # POST /catalogs/suppliers
  # POST /catalogs/suppliers.json
  def create
    @catalogs_supplier = Catalogs::Supplier.new(catalogs_supplier_params)

    respond_to do |format|
      if @catalogs_supplier.save
        format.html { redirect_to @catalogs_supplier, notice: 'Supplier was successfully created.' }
        format.json { render :show, status: :created, location: @catalogs_supplier }
      else
        format.html { render :new }
        format.json { render json: @catalogs_supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catalogs/suppliers/1
  # PATCH/PUT /catalogs/suppliers/1.json
  def update
    respond_to do |format|
      if @catalogs_supplier.update(catalogs_supplier_params)
        format.html { redirect_to @catalogs_supplier, notice: 'Supplier was successfully updated.' }
        format.json { render :show, status: :ok, location: @catalogs_supplier }
      else
        format.html { render :edit }
        format.json { render json: @catalogs_supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catalogs/suppliers/1
  # DELETE /catalogs/suppliers/1.json
  def destroy
    @catalogs_supplier.destroy
    respond_to do |format|
      format.html { redirect_to catalogs_suppliers_url, notice: 'Supplier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catalogs_supplier
      @catalogs_supplier = Catalogs::Supplier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catalogs_supplier_params
      params.require(:catalogs_supplier).permit(:business_name, :contact, :phones, :email)
    end
end
