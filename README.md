# LightWeightDM 

 Light dependancy Injection Library(LightWeightDM) provide way in your software system for seperation of concerns and increase testablity. 

#### The functional use case considered for developing this library #### 
- Inject mock dependency that would support unit testing 
- Generic framework which can be used with minimal constraints 
- Possibility to extend the capability of resolving dependency.

The above not an exhaustive list, however these where the thoughts that lead to the light weight library.

![](/readme_res/ClassDiagram.png)

From the class diagram we can see that the major component is the DependencyManager class. DependencyManager shall have two method one to get the dependancy and other one to register dependancy. 

DependencyManager has a Registry object. The function of the registry is to keep track of the various dependency. The registry has a Dictionary that act as a store. Typically in swift any class that which have implemented a Hashable protocol could be the key for the dictionary.

 In this case we have abstracted the key as RegistryKey. RegistryKey has a name property and a static method that which would return a RegistryKey instance. The parameter passed could be type with an optional prefix to create the RegistryKey instance. The key would be used to register and  retrieve the dependancy by the DependancyManager instance.

The dictionary value is abstracted as a Resolver enumeration. The enum would be a right candidate for this abstraction due to the Associated Enum capability of swift.
