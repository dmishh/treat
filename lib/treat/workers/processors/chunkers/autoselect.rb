class Treat::Workers::Processors::Chunkers::Autoselect

  def self.chunk(entity, options = {})
    unless entity.has?(:format)
      entity.set :format, 'txt'
    end
    begin
      k = Treat::Workers::Processors::
      Chunkers.const_get(entity.format.cc)
      k.chunk(entity, options)
    rescue Treat::Exception
      Treat::Workers::Processors::
      Chunkers::TXT.chunk(entity, options)
    end
    
  end

end
