def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  
  index = 0 
  
  while index < collection.length do
    if collection[index][:item] == name 
      return collection[index]
    end
    
    index += 1
  end
  nil
end

#returns the position of the value in the array.
#return nil if value isn't in array
def find_index_of_value_in_array(value, array)
  index = 0
  while index < array.length do 
    if array[index] == value
      return index
    end
    index += 1
  end
  nil
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  consolidated_cart = []
  index = 0 
  #goes through cart
  while index< cart.length do
    
    #verifies that the new array 
    result = find_index_of_value_in_array(cart[index], consolidated_cart)
    
    if result == nil
      cart[index][:count] = 1
      consolidated_cart.push(cart[index])
    else
      consolidated_cart[result][:count] += 1
    end
    index += 1
  end
  consolidated_cart
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  i = 0 
  j = 0 
  cart_with_coupons = cart
  
  while i < cart.length do 
    j=0
      while j< coupons.length do
        #verify if there is a coupon for that item
        if cart[i][:item] == coupons[j][:item]
         #loop :  1) verify that the coupon can be used  
         #        2) apply the coupon once
         #        3) create/modify hash to add to array
         
         #1
         while cart[i][:count] >= coupons[j][:num] do
           #2 
           cart[i][:count] -= coupons[j][:num]
           
           #3 
           cart_with_coupons.push({:item => ""+ cart[i][:item] + " W/COUPON",
            :price => coupons[j][:cost]/coupons[j][:num],
            :clearance => cart[i][:clearance],
            :count => coupons[j][:num]
           })
           
          end
          
        end
       
        j += 1 
      end
    
    i += 1 
  end
  cart_with_coupons
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  i = 0 
  clearance_cart = cart
  while i < cart.length do
    if cart[i][:clearance] == true
      clearance_cart[i][:price] = cart[i][:price] - cart[i][:price] * 0.2
      clearance_cart[i][:price].round(2)
      
    end
    
     i += 1
  end
  
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
