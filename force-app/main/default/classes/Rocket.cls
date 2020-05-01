/**
 * Defines what all 🚀 have to do
 * @author Jose Berardo Cunha
 * @since 30/04/2020
 */
public interface Rocket {
  /**
   * Define your own logic to decide if your rocket is good to go
   * @param fireWhen A System.TriggerOperation to let you know when your rocket is being fired off
   * @param propellant A version of the Propellant object for your references
   * @returns `Boolean` If false, your rocket won't fire off
   */
  Boolean canFire(TriggerOperation fireWhen, Propellant propellant);
}
