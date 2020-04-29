@isTest
public class OnDeleteBulletTest {
  @isTest
  public static void testSetConstructor() {
    Set<SObject> oldSet = new Set<SObject>();
    OnDeleteBulletImpl bullet = new OnDeleteBulletImpl(oldSet);
    System.assertEquals(oldSet, bullet.exposeSet(), 'oldSet not properly assigned');
  }

  @isTest
  public static void testMapConstructor() {
    Map<ID, SObject> oldMap = new Map<ID, SObject>();
    OnDeleteBulletImpl bullet = new OnDeleteBulletImpl(oldMap);
    System.assertEquals(oldMap, bullet.exposeMap(), 'oldMap not properly assigned');
  }

  @isTest
  public static void testCanFire() {
    Set<SObject> oldSet = new Set<SObject>();
    OnDeleteBulletImpl bullet = new OnDeleteBulletImpl(oldSet);
    System.assert(
      bullet.canFire(TriggerOperation.BEFORE_DELETE, null),
      'Can Fire on before delete'
    );
    System.assert(
      bullet.canFire(TriggerOperation.AFTER_DELETE, null),
      'Can Fire on after delete'
    );
    System.assertEquals(
      false,
      bullet.canFire(TriggerOperation.AFTER_UPDATE, null),
      'Cannot Fire on after update'
    );
  }

  class OnDeleteBulletImpl extends OnDeleteBullet {
    public OnDeleteBulletImpl(Set<SObject> oldSet) {
      super(oldSet);
    }
    public OnDeleteBulletImpl(Map<ID, SObject> oldMap) {
      super(oldMap);
    }
    public void onBeforeFire() {
      System.debug('Test');
    }
    public void onAfterFire() {
      System.debug('Test');
    }
    public Set<SObject> exposeSet() {
      return oldSet;
    }
    public Map<ID, SObject> exposeMap() {
      return oldMap;
    }
  }
}
