import React, { Component } from 'react';
import Card from '@material-ui/core/Card';
import CardActionArea from '@material-ui/core/CardActionArea';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import Typography from '@material-ui/core/Typography';

import { Register, Count } from './Api';


const styles = {
    card: {
        maxWidth: 345,
        minHeight: 345,
        marginTop: 20,
    }
}


export default class MyCard extends Component {

    constructor(props) {
        super(props);
        this.state = { beers: 0, milks: 0 }
        this._handleCount()
    }

    _handleChange = async (e) => {
        await Register(this.props.params)
    }

    _handleCount = async () => {
        let response = await Count()
        this.setState({
            beers: response.beers,
            milks: response.milks
        })
    }

    componentDidMount() {
        setInterval(this._handleCount, 3500)
    }

    render() {
        return (
            <Card style={styles.card} onClick={this._handleChange}>
                <CardActionArea>
                    <CardMedia
                        component="img"
                        alt="Image"
                        height="240"
                        image={this.props.imgUrl}
                        title="Image"
                    />
                    <CardContent>
                        <Typography gutterBottom variant="h5" component="h2">
                            {this.props.title} {this.state[this.props.count_type]} votos
                        </Typography>
                    </CardContent>
                </CardActionArea>
            </Card>
        );
    }
}