/**
 *
 *         ^
 *        / \
 *       /___\
 *      |=   =|
 *      |  _  |
 *      | (_) |
 *      |     |
 *      |  _  |
 *     /| (_) |\   
 *    / |     | \  
 *   /  |##!##|  \ 
 *  |  /|##!##|\  |
 *  | / |##!##| \ |
 *  |/   ^ | ^   \|
 *       ( | )
 *      ((   ))
 *     (( pro ))
 *     (( pel ))
 *     (( lan ))
 *      (( t ))
 *       (( ))
 *        ( )
 *         .
 *         .
 *
 * Main object that fires off before and after trigger rockets.
 * @author Jose Berardo Cunha
 * @since 30/04/2020
 */
public with sharing class Propellant {
  public OnBeforeRocket beforeRocket { get; private set; }
  public OnAfterRocket afterRocket { get; private set; }
  public Tank tank { get; private set; }

  @TestVisible
  private Boolean skipForTestingPurposes = false;

  /**
   * Creates a propellant with only before rocket
   * @param rocket Object that knows what to do on before trigger event
   */
  public Propellant(OnBeforeRocket rocket) {
    this(rocket, null, null);
  }

  /**
   * Creates a propellant with only after rocket
   * @param rocket Object that knows what to do on after trigger event
   */
  public Propellant(OnAfterRocket rocket) {
    this(null, rocket, null);
  }

  /**
   * Creates a propellant with before and after rockets.
   * Use the same object on both if it implements `OnBeforeRocket` and `OnAfterRocket`.
   * @param beforeRocket Object that knows what to do on before trigger event
   * @param afterRocket Object that knows what to do on after trigger event
   */
  public Propellant(OnBeforeRocket beforeRocket, OnAfterRocket afterRocket) {
    this(beforeRocket, afterRocket, null);
  }

  /**
   * Creates a propellant with before rocket and a tank to serve as a guarantor if it works or not
   * @param rocket Object that knows what to do on before trigger event
   * @param tank Tank to restrict the rocket to fire off only if it still has capacity
   */
  public Propellant(OnBeforeRocket rocket, Tank tank) {
    this(rocket, null, tank);
  }

  /**
   * Creates a propellant with before rocket and a tank to serve as a guarantor if it works or not
   * @param rocket Object that knows what to do on after trigger event
   * @param tank Tank to restrict the rocket to fire off only if it still has capacity
   */
  public Propellant(OnAfterRocket rocket, Tank tank) {
    this(null, rocket, tank);
  }

  /**
   * Creates a propellant with before and after rockets, and a tank to serve as a guarantor if it works or not.
   * Use the same object on both if it implements `OnBeforeRocket` and `OnAfterRocket`.
   * @param beforeRocket Object that knows what to do on before trigger event
   * @param afterRocket Object that knows what to do on after trigger event
   */
  public Propellant(OnBeforeRocket beforeRocket, OnAfterRocket afterRocket, Tank tank) {
    this.beforeRocket = beforeRocket;
    this.afterRocket = afterRocket;
    this.tank = tank;
  }

  /**
   * Where the magic happens.
   * Calls your rocket method, consume the tank and return a new instance of propellant with the consumed state.
   * @returns `Propellant` new instance with the consumed state of its tank
   */
  public Propellant fireOff() {
    if (canTakeOffBeforeRocket()) {
      beforeRocket.flyOnBefore();
      if (tank != null && !canTakeOffAfterRocket()) {
        return new Propellant(beforeRocket, tank.consume());
      }
    }
    if (canTakeOffAfterRocket()) {
      afterRocket.flyOnAfter();
      if (tank != null) {
        return new Propellant(afterRocket, tank.consume());
      }
    }

    return this;
  }

  private Boolean canTakeOffBeforeRocket() {
    return beforeRocket != null &&
      (Trigger.isExecuting && Trigger.isBefore && beforeRocket != null &&
      ((Rocket) beforeRocket).canTakeOff(Trigger.operationType, this) || skipForTestingPurposes);
  }

  private Boolean canTakeOffAfterRocket() {
    return afterRocket != null &&
      (Trigger.isExecuting && Trigger.isAfter && afterRocket != null &&
      ((Rocket) beforeRocket).canTakeOff(Trigger.operationType, this) || skipForTestingPurposes);
  }
}
