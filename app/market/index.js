window.urb = new Channel();

// const sendSubData = (msg) => {
//     window.urb.poke(window.ship, 'chanel', 'chanel-action',
//                     {'send-sub-data': {'path': '/example', 'msg': msg}},
//                     () => 'sent', (err) => console.log(err));
// };

const addItem = () => {
    window.urb.poke(window.ship, 'market', 'market-server-action',
        {'add-item': {
            'seller': window.ship,
            'index': [1, 2],
            'name': 'test poke item',
            'description': 'testdescription',
            'image-url': 'https://not-an-image.com/asdf.jpeg',
            'price': 1.123,
            'time-posted': '~2020.7.4..08.39.17..541e',
            }
        },
        () => 'sent',
        (err) => console.log(err));
};

const removeItem = () => {
    window.urb.poke(window.ship, 'market', 'market-server-action',
        {'remove-item': {'index': [1, 2]}},
        () => 'sent',
        (err) => console.log(err));
};

const makeOffer = () => {
    window.urb.poke(window.ship, 'market', 'market-client-action',
        {'make-offer': {
            'index': [1, 2],
            'amount': 123,
            'from': window.ship,
        }},
        () => 'sent',
        (err) => console.log(err));
}

const removeOffer = () => {
    window.urb.poke(window.ship, 'market', 'market-client-action',
    {'remove-offer': {
        'index': [1, 2],
        'amount': 123,
        'from': window.ship,
    }},
    () => 'sent',
    (err) => console.log(err));
}

const login =  async (pass) => {
    let loginRes = await fetch('/~/login', {
        method: 'POST',
        body: `password=${pass}`
    });
    if (loginRes.status != 204) {
        return;
    }
    console.log(loginRes.status);
    console.log("logged in");

    const res = await fetch('/~landscape/js/session.js');
    const sessionCode = await res.text();
    eval(sessionCode);
};

const passwords = {
    'zod': 'lidlut-tabwed-pillex-ridrup',
    'timluc': 'tilhep-bittul-happex-motlet'
};
Object.keys(passwords).forEach(ship => login(passwords[ship]));