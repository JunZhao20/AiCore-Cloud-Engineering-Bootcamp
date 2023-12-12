class Temperature:
    """
    This Class hold functionality for temperature conversions.
    
    Attributes:
    temp_celsius (int): temperature input
    
    """
    def __init__(self, temp_celsius):
        self.temp_celsius = temp_celsius

    def convert_temp_to_fahrenheit(self):
        """
        This function converts the class attribute temp_celsius to fahrenheit
        
        Returns :
            int : returns the converted temperature in fahrenheit

        """
        return (self.temp_celsius * 1.8) + 32

    @staticmethod
    def convert_fahrenheit_to_cel(temp_fah):
        """
        This function converts fahrenheit back to celsius
        
        args :
            temp_fah (int) : takes in fahrenheit to convert back to celsius
        
        Returns :
            int : returns the converted temp to celsius
        
        """
        
        return (temp_fah - 32) * 1.8

    @staticmethod
    def check_valid_temp(temp):
        
        """
        This function checks if the temperature is valid.
        
        args : 
            temp (int) : takes in a temperature to check its validity
            
        outputs :
            string : it will print "This is a valid temperature" if temp is valid
        
        """
        
        if -273 <= temp <= 3000:
            print("This is a valid temperature")

    @classmethod
    def create_with_fahrenheit(cls, temperature):
        
        """
        This function creates an instance with a default temperature conversion of fahrenheit.
        
        args :
            temperature (int) : takes in a temperature to convert to fahrenheit.
            
        Returns : 
            object : it will return an instance with the converted temperature of fahrenheit.
            int : converted temperature of fahrenheit.
        
        """
        
        return cls(Temperature.convert_fahrenheit_to_cel(temperature))

    @classmethod
    def standard(cls):
        """
        This function creates an instance of this class with a default arg as 0.
        
        Returns :
            object: This returns and creates a instance with a default arg of 0
        
        """
        return cls(0)

    def __repr__(self) -> str:
        
        """
        This function returns a string representation of the instances temp attribute.
        
        Returns :
            int : It returns the instances temp attribute value.
        
        """
        
        temp = str(self.temp_celsius)
        return temp