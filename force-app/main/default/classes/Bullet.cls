/**
 * Defines what all bullets have to do
 * @author Jose Berardo Cunha
 * @since 30/04/2020
 */
public interface Bullet {
  /**
   * Define your own logic to decide if your bullet is good to go
   * @param fireWhen A System.TriggerOperation to let you know when your bullet is being fired off
   * @param propellant A version of the Propellant object for your references
   * @returns `Boolean` If false, your bullet won't fire off
   */
  Boolean canFire(TriggerOperation fireWhen, Propellant propellant);
}
