public with sharing class Propellant {
  public OnBeforeBullet beforeBullet { get; private set; }
  public OnAfterBullet afterBullet { get; private set; }
  public Tank tank { get; private set; }

  @TestVisible
  private Boolean skipForTestingPurposes = false;

  public Propellant(OnBeforeBullet bullet) {
    this(bullet, null, null);
  }

  public Propellant(OnAfterBullet bullet) {
    this(null, bullet, null);
  }

  public Propellant(OnBeforeBullet beforeBullet, OnAfterBullet afterBullet) {
    this(beforeBullet, afterBullet, null);
  }

  public Propellant(OnBeforeBullet bullet, Tank tank) {
    this(bullet, null, tank);
  }

  public Propellant(OnAfterBullet bullet, Tank tank) {
    this(null, bullet, tank);
  }

  public Propellant(OnBeforeBullet beforeBullet, OnAfterBullet afterBullet, Tank tank) {
    this.beforeBullet = beforeBullet;
    this.afterBullet = afterBullet;
    this.tank = tank;
  }

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
