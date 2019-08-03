def pet_shop_name(hash)
  return hash[:name]
end

def total_cash(hash)
  return hash[:admin][:total_cash]
end

def add_or_remove_cash(hash, amount)
  return hash[:admin][:total_cash] += amount
end

def pets_sold(hash)
  return hash[:admin][:pets_sold]
end

def increase_pets_sold(hash, amount)
  return hash[:admin][:pets_sold] += amount
end
