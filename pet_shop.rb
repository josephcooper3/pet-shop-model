def pet_shop_name(pet_shop_hash)
  return pet_shop_hash[:name]
end

def total_cash(pet_shop_hash)
  return pet_shop_hash[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop_hash, amount)
  return pet_shop_hash[:admin][:total_cash] += amount
end

def pets_sold(pet_shop_hash)
  return pet_shop_hash[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop_hash, amount)
  return pet_shop_hash[:admin][:pets_sold] += amount
end

def stock_count(pet_shop_hash)
  return pet_shop_hash[:pets].length
end

def pets_by_breed(pet_shop_hash, breed)
  breed_array = []
  for pet in pet_shop_hash[:pets]
    if breed == pet[:breed]
      breed_array << pet
    end
  end
  return breed_array
end

def find_pet_by_name(pet_shop_hash, pet_name)
  for pet in pet_shop_hash[:pets]
    if pet_name == pet[:name]
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop_hash, pet_name)
  for pet in pet_shop_hash[:pets]
    if pet_name == pet[:name]
      pet_shop_hash[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop_hash, new_pet_hash)
  pet_shop_hash[:pets] << new_pet_hash
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, new_pet_hash)
  customer[:pets] << new_pet_hash
end

def customer_can_afford_pet(customer, new_pet_hash)
  if customer[:cash] >= new_pet_hash[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop_hash, pet_requested, customer)
  return nil if pet_requested.class != Hash
  pet_to_buy = find_pet_by_name(pet_shop_hash, pet_requested[:name])
  return nil if pet_to_buy == nil
  return nil if customer_can_afford_pet(customer, pet_to_buy) == false
  customer[:cash] -= pet_to_buy[:price]
  pet_shop_hash[:admin][:total_cash] += pet_to_buy[:price]
  pet_shop_hash[:pets].delete(pet_to_buy)
  pet_shop_hash[:admin][:pets_sold] += 1
  customer[:pets] << pet_to_buy
end
