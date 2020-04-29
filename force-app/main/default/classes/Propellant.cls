public with sharing class Propellant {
  public OnBeforeBullet beforeBullet { get; private set; }
  public OnAfterBullet afterBullet { get; private set; }
  public Tank tank { get; private set; }

  @TestVisible
  private Boolean skipForTestingPurposes = false;

  public Propellant(OnBeforeBullet bullet) {
    beforeBullet = bullet;
  }

  public Propellant(OnAfterBullet bullet) {
    afterBullet = bullet;
  }

  public Propellant(OnBeforeBullet beforeBullet, OnAfterBullet afterBullet) {
    this.beforeBullet = beforeBullet;
    this.afterBullet = afterBullet;
  }

  public Propellant(OnBeforeBullet bullet, Tank tank) {
    this(bullet);
    this.tank = tank;
  }

  public Propellant(OnAfterBullet bullet, Tank tank) {
    this(bullet);
    this.tank = tank;
  }

  public Propellant(OnBeforeBullet beforeBullet, OnAfterBullet afterBullet, Tank tank) {
    this(beforeBullet, afterBullet);
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
