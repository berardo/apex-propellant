@isTest
public with sharing class PropellantTest {
  @isTest
  public static void testOnBeforeBulletConstructor() {
    OnBeforeBullet bullet = new OnBeforeBulletTest();
    Propellant p = new Propellant(bullet);
    System.assertEquals(bullet, p.beforeBullet, 'Bullet not properly assigned');
  }

  @isTest
  public static void testOnAfterBulletConstructor() {
    OnAfterBullet bullet = new OnAfterBulletTest();
    Propellant p = new Propellant(bullet);
    System.assertEquals(bullet, p.afterBullet, 'Bullet not properly assigned');
  }

  @isTest
  public static void testOnBothConstructor() {
    OnBeforeBullet beforeBullet = new OnBeforeBulletTest();
    OnAfterBullet afterBullet = new OnAfterBulletTest();
    Propellant p = new Propellant(beforeBullet, afterBullet);
    System.assertEquals(beforeBullet, p.beforeBullet, 'Before bullet not properly assigned');
    System.assertEquals(afterBullet, p.afterBullet, 'After bullet not properly assigned');
  }

  @isTest
  public static void testOnBeforeBulletWithTankConstructor() {
    Tank t = new Tank();
    OnBeforeBullet bullet = new OnBeforeBulletTest();
    Propellant p = new Propellant(bullet, t);
    System.assertEquals(bullet, p.beforeBullet, 'Bullet not properly assigned');
    System.assertEquals(t, p.tank, 'Tank not properly assigned');
  }

  @isTest
  public static void testOnAfterBulletWithTankConstructor() {
    Tank t = new Tank();
    OnAfterBullet bullet = new OnAfterBulletTest();
    Propellant p = new Propellant(bullet, t);
    System.assertEquals(bullet, p.afterBullet, 'Bullet not properly assigned');
    System.assertEquals(t, p.tank, 'Tank not properly assigned');
  }

  @isTest
  public static void testOnBothWithTankConstructor() {
    Tank t = new Tank();
    OnBeforeBullet beforeBullet = new OnBeforeBulletTest();
    OnAfterBullet afterBullet = new OnAfterBulletTest();
    Propellant p = new Propellant(beforeBullet, afterBullet, t);
    System.assertEquals(beforeBullet, p.beforeBullet, 'Before bullet not properly assigned');
    System.assertEquals(afterBullet, p.afterBullet, 'After bullet not properly assigned');
    System.assertEquals(t, p.tank, 'Tank not properly assigned');
  }

  @isTest
  public static void testFireOffCannotRun() {
    Tank t = new Tank();
    OnBeforeBullet beforeBullet = new OnBeforeBulletTest();
    OnAfterBullet afterBullet = new OnAfterBulletTest();
    
    Propellant prop = new Propellant(beforeBullet, afterBullet, t);
    Propellant newProp = prop.fireOff();

    System.assertEquals(0, newProp.tank.consumed, 'Tank cannot be consumed');
  }

  @isTest
  public static void testFireOffCanRun() {
    Tank t = new Tank();
    OnBeforeBullet beforeBullet = new OnBeforeBulletTest();
    OnAfterBullet afterBullet = new OnAfterBulletTest();
    
    Propellant prop1 = new Propellant(beforeBullet, t);
    Propellant prop2 = new Propellant(afterBullet, t);
    Propellant prop3 = new Propellant(beforeBullet, afterBullet, t);
    prop1.skipForTestingPurposes = true;
    prop2.skipForTestingPurposes = true;
    prop3.skipForTestingPurposes = true;
    Propellant newProp1 = prop1.fireOff();
    Propellant newProp2 = prop2.fireOff();
    Propellant newProp3 = prop3.fireOff();

    System.assertEquals(1, newProp1.tank.consumed, 'Tank must be consumed');
    System.assertEquals(1, newProp2.tank.consumed, 'Tank must be consumed');
    System.assertEquals(1, newProp3.tank.consumed, 'Tank must be consumed');
  }

  private class OnBeforeBulletTest implements OnBeforeBullet {
    public void onBeforeFire() {
      System.debug('Test');
    }
    public Boolean canFire(TriggerOperation fireWhen, Propellant propellant) {
      return true;
    }
  }
  private class OnAfterBulletTest implements OnAfterBullet {
    public void onAfterFire() {
      System.debug('Test');
    }
    public Boolean canFire(TriggerOperation fireWhen, Propellant propellant) {
      return true;
    }
  }
}
