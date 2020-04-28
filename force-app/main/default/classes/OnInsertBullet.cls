public abstract class OnInsertBullet implements OnBeforeBullet, OnAfterBullet {
  protected Set<SObject> newSet;
  protected Map<ID, SObject> newMap;

  @SuppressWarnings('PMD.EmptyStatementBlock') 
  private OnInsertBullet() {
  }

  public OnInsertBullet(Set<SObject> newSet) {
    this.newSet = newSet;
  }
  public OnInsertBullet(Map<ID, SObject> newMap) {
    this.newMap = newMap;
  }
}
