import React from 'react';

class UserProfile extends React.Component {
  constructor(props) {
    super(props);
  }

  renderPicture() {
   return <img className="ui medium rounded centered image" src={this.props.user.picture.url} />
  }

  renderFavorites() {
    if (this.props.votes.length === 0) {
      return
        <div>
          <button class="ui button"><a href={this.props.homeLink}>Find Your New Home</a></button>
        </div>;
    } else {
      return <button className="ui button"><a href="my_votes">My Favorites</a></button>
    }
  }


  renderRentals() {
    if (this.props.rentals.length === 0) {
      return
        <div>
          <button class="ui button"><a href={this.props.newRentalLink}>Post a New Listing</a></button>
        </div>;
    } else {
      return <button className="ui button"><a href="my_rentals">My Rentals</a></button>;
    }
  }
  render() {
    console.log(this.props);
    return (
      <div>
        <div className="ui two column centered grid">
          <div className="two column centered row"><h1>Account</h1></div>
          <div className="two column centered row">{this.renderPicture()}</div>
          <div className="two column centered row">{this.props.user.email}</div>
        </div>

        {this.renderRentals()}
        {this.renderFavorites()}
      </div>
    );
  }
}

export default UserProfile;
