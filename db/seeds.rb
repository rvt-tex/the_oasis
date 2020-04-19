# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

LDM = Treatment.create(title:'LDM (Lymphatic Drainage Massage)', price:'$120', duration:'90 mins', description:'Lymphatic massage can help in the prevention 
    of swelling after injury or surgery. It is thought to provide a major boost to your immune system. This also helps to rapidly speed up the removal of 
    wastes and toxins from a sluggish lymphatic system.')

Body Contouring = Treatment.create(title:'Body Contouring', price:'$80', duration:'60 mins', description:'Body Contouring transmits ultrasonic waves into 
    the fat layer of the skin, stimulating lipolysis of fat cells. These fat cells are then expelled from the body naturally through urine and bowel movement. 
    Removing fats in the body results in inches loss at the treated area. Recommended sessions for results are 8-12 sessions. Twice a week with proper diet and exercise.')

Skin Tightening = Treatment.create(title:'Skin Tightening/ Cellulite Reduction', price:'$90', duration:'60 mins', description:'Cellulite is caused by lack of oxygen and 
    blood flow to certain areas of the body prone to being stagnant and lack of blood flow. This treatment uses different levels of sound waves to shatter and destroy the 
    connective fibers causing cellulite. The increased blood flow to the area being treated will have a smoother look and feel where cellulite used to be. Increased blood 
    flow means increased oxygen to the site and an increase in collagen production. This treatment can treat loose skin on the face, neck (and chin), décolletage, stomach, 
    thighs, and basically anywhere else on the body you want to improve.')

Ultrasound Therapy = Treatment.create(title:'Ultrasound Therapy', price:'$50', duration:'30 mins', description:'The effect of ultrasound can increase the blood flow can be used 
    to help reduce local swelling and chronic inflammation. A popular non-surgical option for healthier stronger looking skin. These treatments use infrared light to heat the skin, 
    the heat causes the underlying collagen to contract immediately, thus aiding in the gradual production of more collagen.')

b_12 shot = Treatment.create(title:'B-12 Shot ', price:'$30', duration:'20 mins', description:'Shot giving to help your body use fat and carbohydrates for energy and make new 
    protein. It is also important for normal blood, cells, and nerves. Improves the energy levels, brain function and helps with weight loss.')

Wood Therapy = Treatment.create(title:'Wood Therapy', price:'$60', duration:'60 mins', description:'Lymphatic massage can help in the prevention of swelling after injury or 
    surgery. It is thought to provide a major boost to your immune system. This also helps to rapidly speed up the removal of wastes and toxins from a sluggish lymphatic system.')

Facial = Treatment.create(title:'Facial', price:'$60', duration:'50 mins', description:'This is a beauty treatment that is designed to exfoliate, invigorate or treat the skin of 
    the face. This is a relaxing services where the skin on the face/neck are being treated.')

Minks = Treatment.create(title:'Minks', price:'$125', duration:'80 mins', description:'Mink eyelash extensions are the modern way to add length, volume and even curl to your 
    natural eyelashes. Once applied, mink eyelash extensions will cut the time you spend getting ready in the morning, or for a night out in half.')

Full Body Detox Wrap = Treatment.create(title:'Full Body Detox Wrap', price:'$45', duration:'30 mins', description:'This treatment uses special products that rid your body of 
    toxins, thereby improving health and promoting weight loss. The fat is excreted naturally after treatment is preformed.')

Post_op_care = Treatment.create(title:'Post-Op Care', price:'$60', duration:'60 mins', description:"Care that is received after any surgical procedures. This service depends 
    on the type of surgery you will have, as well as heath history. This will include pain management and wound care. Begins immediately after surgery and can continue after
    you've been discharged.")