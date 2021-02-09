module {
  public type UserId = Principal;

  public type Profile = {
    id: UserId;
    firstName: Text;
    lastName: Text;
    email: Text;
    imgUrl: Text;
  };

  public type NewProfile = {
    firstName: Text;
    lastName: Text;
    email: Text;
    imgUrl: Text;
  };

  /// Entity type: Item
  public type Item = {
    name : Text;
    borrower: UserId;
  };
}