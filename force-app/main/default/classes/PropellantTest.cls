@isTest
public with sharing class PropellantTest {
  @isTest
  public static void testOnBeforeRocketConstructor() {
    OnBeforeRocket rocket = new OnBeforeRocketTest();
    Propellant p = new Propellant(rocket);
    System.assertEquals(rocket, p.beforeRocket, 'Rocket not properly assigned');
  }

  @isTest
  public static void testOnAfterRocketConstructor() {
    OnAfterRocket rocket = new OnAfterRocketTest();
    Propellant p = new Propellant(rocket);
    System.assertEquals(rocket, p.afterRocket, 'Rocket not properly assigned');
  }

  @isTest
  public static void testOnBothConstructor() {
    OnBeforeRocket beforeRocket = new OnBeforeRocketTest();
    OnAfterRocket afterRocket = new OnAfterRocketTest();
    Propellant p = new Propellant(beforeRocket, afterRocket);
    System.assertEquals(beforeRocket, p.beforeRocket, 'Before rocket not properly assigned');
    System.assertEquals(afterRocket, p.afterRocket, 'After rocket not properly assigned');
  }

  @isTest
  public static void testOnBeforeRocketWithTankConstructor() {
    Tank t = new Tank();
    OnBeforeRocket rocket = new OnBeforeRocketTest();
    Propellant p = new Propellant(rocket, t);
    System.assertEquals(rocket, p.beforeRocket, 'Rocket not properly assigned');
    System.assertEquals(t, p.tank, 'Tank not properly assigned');
  }

  @isTest
  public static void testOnAfterRocketWithTankConstructor() {
    Tank t = new Tank();
    OnAfterRocket rocket = new OnAfterRocketTest();
    Propellant p = new Propellant(rocket, t);
    System.assertEquals(rocket, p.afterRocket, 'Rocket not properly assigned');
    System.assertEquals(t, p.tank, 'Tank not properly assigned');
  }

  @isTest
  public static void testOnBothWithTankConstructor() {
    Tank t = new Tank();
    OnBeforeRocket beforeRocket = new OnBeforeRocketTest();
    OnAfterRocket afterRocket = new OnAfterRocketTest();
    Propellant p = new Propellant(beforeRocket, afterRocket, t);
    System.assertEquals(beforeRocket, p.beforeRocket, 'Before rocket not properly assigned');
    System.assertEquals(afterRocket, p.afterRocket, 'After rocket not properly assigned');
    System.assertEquals(t, p.tank, 'Tank not properly assigned');
  }

  @isTest
  public static void testFireOffCannotRun() {
    Tank t = new Tank();
    OnBeforeRocket beforeRocket = new OnBeforeRocketTest();
    OnAfterRocket afterRocket = new OnAfterRocketTest();
    
    Propellant prop = new Propellant(beforeRocket, afterRocket, t);
    Propellant newProp = prop.fireOff();

    System.assertEquals(0, newProp.tank.consumed, 'Tank cannot be consumed');
  }

  @isTest
  public static void testFireOffCanRun() {
    Tank t = new Tank();
    OnBeforeRocket beforeRocket = new OnBeforeRocketTest();
    OnAfterRocket afterRocket = new OnAfterRocketTest();
    
    Propellant prop1 = new Propellant(beforeRocket, t);
    Propellant prop2 = new Propellant(afterRocket, t);
    Propellant prop3 = new Propellant(beforeRocket, afterRocket, t);
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

  private class OnBeforeRocketTest implements OnBeforeRocket {
    public void flyOnBefore() {
      System.debug('Test');
    }
    public Boolean canTakeOff(TriggerOperation fireWhen, Propellant propellant) {
      return true;
    }
  }
  private class OnAfterRocketTest implements OnAfterRocket {
    public void flyOnAfter() {
      System.debug('Test');
    }
    public Boolean canTakeOff(TriggerOperation fireWhen, Propellant propellant) {
      return true;
    }
  }
}
