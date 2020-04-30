/**
 * Main object that fires off before and after trigger bullets.
 * @author Jose Berardo Cunha
 * @since 30/04/2020
 */
public with sharing class Propellant {
  public OnBeforeBullet beforeBullet { get; private set; }
  public OnAfterBullet afterBullet { get; private set; }
  public Tank tank { get; private set; }

  @TestVisible
  private Boolean skipForTestingPurposes = false;

  /**
   * Creates a propellant with only before bullet
   * @param bullet Object that knows what to do on before trigger event
   */
  public Propellant(OnBeforeBullet bullet) {
    this(bullet, null, null);
  }

  /**
   * Creates a propellant with only after bullet
   * @param bullet Object that knows what to do on after trigger event
   */
  public Propellant(OnAfterBullet bullet) {
    this(null, bullet, null);
  }

  /**
   * Creates a propellant with before and after bullets.
   * Use the same object on both if it implements `OnBeforeBullet` and `OnAfterBullet`.
   * @param beforeBullet Object that knows what to do on before trigger event
   * @param afterBullet Object that knows what to do on after trigger event
   */
  public Propellant(OnBeforeBullet beforeBullet, OnAfterBullet afterBullet) {
    this(beforeBullet, afterBullet, null);
  }

  /**
   * Creates a propellant with before bullet and a tank to serve as a guarantor if it works or not
   * @param bullet Object that knows what to do on before trigger event
   * @param tank Tank to restrict the bullet to fire off only if it still has capacity
   */
  public Propellant(OnBeforeBullet bullet, Tank tank) {
    this(bullet, null, tank);
  }

  /**
   * Creates a propellant with before bullet and a tank to serve as a guarantor if it works or not
   * @param bullet Object that knows what to do on after trigger event
   * @param tank Tank to restrict the bullet to fire off only if it still has capacity
   */
  public Propellant(OnAfterBullet bullet, Tank tank) {
    this(null, bullet, tank);
  }

  /**
   * Creates a propellant with before and after bullets, and a tank to serve as a guarantor if it works or not.
   * Use the same object on both if it implements `OnBeforeBullet` and `OnAfterBullet`.
   * @param beforeBullet Object that knows what to do on before trigger event
   * @param afterBullet Object that knows what to do on after trigger event
   */
  public Propellant(OnBeforeBullet beforeBullet, OnAfterBullet afterBullet, Tank tank) {
    this.beforeBullet = beforeBullet;
    this.afterBullet = afterBullet;
    this.tank = tank;
  }

  /**
   * Where the magic happens.
   * Calls your bullet method, consume the tank and return a new instance of propellant with the consumed state.
   * @returns `Propellant` new instance with the consumed state of its tank
   */
  public Propellant fireOff() {
    if (canFireBeforeBullet()) {
      beforeBullet.onBeforeFire();
      if (tank != null && !canFireAfterBullet()) {
        return new Propellant(beforeBullet, tank.consume());
      }
    }
    if (canFireAfterBullet()) {
      afterBullet.onAfterFire();
      if (tank != null) {
        return new Propellant(afterBullet, tank.consume());
      }
    }

    return this;
  }

  private Boolean canFireBeforeBullet() {
    return beforeBullet != null &&
      (Trigger.isExecuting && Trigger.isBefore && beforeBullet != null &&
      ((Bullet) beforeBullet).canFire(Trigger.operationType, this) || skipForTestingPurposes);
  }

  private Boolean canFireAfterBullet() {
    return afterBullet != null &&
      (Trigger.isExecuting && Trigger.isAfter && afterBullet != null &&
      ((Bullet) beforeBullet).canFire(Trigger.operationType, this) || skipForTestingPurposes);
  }
}
