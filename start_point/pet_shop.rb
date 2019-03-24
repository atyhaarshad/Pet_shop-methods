def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  new_amount = pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  pets_sold = pet_shop[:admin][:pets_sold]
  return pets_sold
end

def increase_pets_sold(pet_shop, number)
  pets_sold = pet_shop[:admin][:pets_sold] += number
  return pets_sold
end

def stock_count(pet_shop)
  stock_count = pet_shop[:pets].count
return stock_count
end

def pets_by_breed(pet_shop, breed)

  filtered_pets = []

  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      filtered_pets.push(pet)
    end
  end
    return filtered_pets
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
      return pet
    end
  end

  return nil

end

def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_cash(customer)
  cash = customer[:cash]
  return cash
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  pet_count = customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  add_pet = customer[:pets].push(new_pet)
end

## OPTIONAL

def customer_can_afford_pet(customer, new_pet)
  return customer[:cash] > new_pet[:price]
end

def sell_pet_to_customer(pet_shop, pet, customer)

  petExists = pet != nil && find_pet_by_name(pet_shop, pet[:name]) != nil

  if (petExists && customer_can_afford_pet(customer, pet))

    remove_customer_cash(customer, pet[:price])
    add_pet_to_customer(customer, pet)
    increase_pets_sold(pet_shop, 1)
    add_or_remove_cash(pet_shop, pet[:price])
  end
end
