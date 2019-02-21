module FromJson
  def from_json(json)
    new(**json.transform_keys(&:to_sym))
  end
end
