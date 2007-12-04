class ManifestoGenerator < Rails::Generator::Base

  def initialize(args, options = {})
    super
  end

  def manifest
    record do |m|
      controllers_dir = "app/controllers"
      models_dir = "app/models"
      views_dir = "app/views"
      migrations_dir = "db/migrate"
      
      controller = "manifestos_controller.rb"
      manifesto_model = "manifesto.rb"
      signature_model = "signature.rb"
      migration = "act_as_manifesto.rb"
      manifesto_views_dir = File.join(views_dir, "manifestos")
      
      m.file controller, File.join(controllers_dir, controller)
      m.file manifesto_model, File.join(models_dir, manifesto_model)
      m.file signature_model, File.join(models_dir, signature_model)

      m.directory manifesto_views_dir
      m.file "views/_form.rhtml", File.join(manifesto_views_dir, "_form.rhtml")
      m.file "views/_signature_form.rhtml", File.join(manifesto_views_dir, "_signature_form.rhtml")
      m.file "views/_signature.rhtml", File.join(manifesto_views_dir, "_signature.rhtml")
      m.file "views/index.rhtml", File.join(manifesto_views_dir, "index.rhtml")
      m.file "views/new.rhtml", File.join(manifesto_views_dir, "new.rhtml")
      m.file "views/show.rhtml", File.join(manifesto_views_dir, "show.rhtml")
      
      m.migration_template migration, migrations_dir
    end
  end
  
  # Used by the "m.migration_template" command above to create the migration file name
  def file_name
    "create_manifesto"
  end

  protected
    # Override with your own usage banner.
    def banner
      "Usage: #{$0} manifesto"
    end
end
