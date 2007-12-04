class ManifestosController < ApplicationController
  def index
    @manifestos = Manifesto.find_all
  end
  
  def show
    @manifesto = Manifesto.find(params[:id])
    @new_signature = Signature.new
    @new_signature.manifesto = @manifesto
  end
  
  def new
    @manifesto = Manifesto.new
  end
  
  def create
    @manifesto = Manifesto.new(params[:manifesto])
    if @manifesto.save
      redirect_to :action => :index
    else
      flash[:error] = "Could not create the manifesto"
      render :action => "new"
    end
  end
  
  def sign
    @new_signature = Signature.new(params[:new_signature])
    if @new_signature.save
      redirect_to :action => :show, :id => @new_signature.manifesto
    else
      flash[:error] = "Could not create the signature"
      render :action => "show", :id => @new_signature.manifesto
    end
  end
end
