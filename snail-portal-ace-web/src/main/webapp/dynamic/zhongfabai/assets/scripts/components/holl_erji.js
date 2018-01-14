cc.Class({
    extends: cc.Component,

    properties: {
        house: cc.Node,
        tfhwd: [cc.Node],
        numbers: [cc.Label],
        numarr: [],
        secret: cc.Node,
        creat_room: cc.Node,
        pople: cc.Node,
        cishu: cc.Node,
        alert_money: [cc.Node],
        my_money: [cc.Label],
        mima: cc.Node,
        editbox: cc.EditBox
    },

    onLoad() {
        // this.node.on(cc.Node.EventType.TOUCH_MOVE, this.touchmove, this)

    },
    //holl所有的二级-- 3级处理监听事件
    touchStrat: function (event) {
        console.log(event.target.name)
        if (event.target.name == "back") {
            this.house.active = false
            this.node.children[11].active = false
            for (var i = 0; i < this.tfhwd.length; i++) {
                this.tfhwd[0].getComponent(cc.Animation).play("tops_in")
                this.tfhwd[1].getComponent(cc.Animation).play("fenxiang_in")
                this.tfhwd[2].getComponent(cc.Animation).play("home_in")
                this.tfhwd[3].getComponent(cc.Animation).play("wanren_in")
                this.tfhwd[4].getComponent(cc.Animation).play("down_in")
            }
        } else if (event.target.name == "creat") {
            this.creat_room.active = true
            this.house.active = false
        } else if (event.target.name == "cloose_back") {
            this.house.active = true
            this.creat_room.active = false
        }
    },
    secretHome: function (event) {
        this.secret.active = true
        if (event.target.name == "New Layout") {
            this.secret.active = false
        }
    },
    secretStrat: function (event) {

        if (this.numarr.length < 6 && event.target.name != 'clear' && event.target.name != 'back') {
            this.numarr.push(event.target.name)
        }
        for (var i = 0; i < this.numbers.length; i++) {
            this.numbers[i].string = this.numarr[i] ? this.numarr[i] : ''
        }
        if (event.target.name == 'clear') {
            this.numarr = []
            for (var i = 0; i < this.numbers.length; i++) {
                this.numbers[i].string = this.numarr[i] ? this.numarr[i] : ''
            }
        }
        if (event.target.name == 'back') {
            console.log(this.numarr)
            this.numarr.pop()
            for (var i = 0; i < this.numbers.length; i++) {
                this.numbers[i].string = this.numarr[i] ? this.numarr[i] : ''
            }
        }
    },
    //创建房间的3种人数选择监听
    pople_choose: function (event) {
        // console.log(event.target.name)
        var pepol = this.pople._children
        for (var i = 0; i < pepol.length; i++) {
            // console.log(pepol[i].name)
            for (var key in pepol[i].children) {
                if (event.target.name == pepol[i].name) {
                    pepol[i].children[key].active = true
                } else {
                    pepol[i].children[key].active = false
                }
                console.log(pepol[i].children[key].active)
            }
        }
    },
    //创建房间的3种次数选择监听
    cishu_choose: function (event) {
        var cishu = this.cishu._children
        for (var i = 0; i < cishu.length; i++) {
            for (var key in cishu[i].children) {
                if (event.target.name == cishu[i].name) {
                    cishu[i].children[key].active = true
                } else {
                    cishu[i].children[key].active = false
                }
            }
        }
    },
    //密码
    mima_alert: function (event) {
        var mima = this.mima._children
        for (var i = 0; i < mima.length; i++) {
            for (var key in mima[i].children) {
                if (event.target.name == mima[i].name) {
                    mima[i].children[key].active = true
                    // if (mima[1].children[key].active = true) {
                    //     this.editbox.active = true
                    // }
                } else {
                    mima[i].children[key].active = false
                }
            }
        }
    },
    //最少携带金币
    touchmove: function (event) {
        for (var i = 0; i < this.alert_money.length; i++) {
            if (this.alert_money[i].name + "<Slider>" == event.name) {
                this.alert_money[i].active = true
            } else {
                this.alert_money[i].active = false
            }
        }
        var my_money = event.progress.toFixed(2)
        if (my_money <= 0) {
            my_money == 0
        } else if (my_money >= 1) {
            my_money == 1
        }
        var pull_money = (my_money * 100).toFixed(0)
        var pull_moneys = (my_money * 100).toFixed(0)
        var pull_moneyss = (my_money * 100).toFixed(0)
        for (var j = 0; j < this.my_money.length; j++) {
            if (event.name.replace("<Slider>", "<Label>") == this.my_money[0].name) {
                this.my_money[0].string = pull_money + "w"
            } else if (event.name.replace("<Slider>", "<Label>") == this.my_money[1].name) {
                this.my_money[1].string = pull_money + "00w"
            } else if (event.name.replace("<Slider>", "<Label>") == this.my_money[2].name) {
                this.my_money[2].string = pull_money + "01w"
            }
        }
        for (var i = 0; i < this.alert_money.length; i++) {
            for (var j = 0; j < this.alert_money[i].children.length; j++) {
                for (var key in this.alert_money[i].children[j]._components) {
                    this.alert_money[i].children[j]._components[key].string = pull_money + "万"
                }
            }
        }
    },
    crearROOM: function (event) {
        console.log(event.target.name)
    },


    start() {

    },

    // update (dt) {},
});
